package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.*;
import com.macro.mall.dto.PmsProductParam;
import com.macro.mall.dto.PmsProductQueryParam;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.mapper.*;
import com.macro.mall.model.*;
import com.macro.mall.service.PmsProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Product management Service implementation class
 * Created by macro on 2018/4/26.
 */
@Service
public class PmsProductServiceImpl implements PmsProductService {
    private static final Logger LOGGER = LoggerFactory.getLogger(PmsProductServiceImpl.class);
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsMemberPriceDao memberPriceDao;
    @Autowired
    private PmsMemberPriceMapper memberPriceMapper;
    @Autowired
    private PmsProductLadderDao productLadderDao;
    @Autowired
    private PmsProductLadderMapper productLadderMapper;
    @Autowired
    private PmsProductFullReductionDao productFullReductionDao;
    @Autowired
    private PmsProductFullReductionMapper productFullReductionMapper;
    @Autowired
    private PmsSkuStockDao skuStockDao;
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private PmsProductAttributeValueDao productAttributeValueDao;
    @Autowired
    private PmsProductAttributeValueMapper productAttributeValueMapper;
    @Autowired
    private CmsSubjectProductRelationDao subjectProductRelationDao;
    @Autowired
    private CmsSubjectProductRelationMapper subjectProductRelationMapper;
    @Autowired
    private CmsPrefrenceAreaProductRelationDao prefrenceAreaProductRelationDao;
    @Autowired
    private CmsPrefrenceAreaProductRelationMapper prefrenceAreaProductRelationMapper;
    @Autowired
    private PmsProductDao productDao;
    @Autowired
    private PmsProductVertifyRecordDao productVertifyRecordDao;

    @Override
    public int create(PmsProductParam productParam) {
        int count;
        //Create product
        PmsProduct product = productParam;
        product.setId(null);
        productMapper.insertSelective(product);
        //Set price by promotion type: member price, tiered price, full-reduction price
        Long productId = product.getId();
        //Member price
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), productId);
        //Tiered price
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), productId);
        //Full reduction price
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), productId);
        //Process the SKU code
        handleSkuStockCode(productParam.getSkuStockList(),productId);
        //Add SKU stock information
        relateAndInsertList(skuStockDao, productParam.getSkuStockList(), productId);
        //Add product parameters,Add custom product specifications
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), productId);
        //Associate topic
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), productId);
        //Associate preferred
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), productId);
        count = 1;
        return count;
    }

    private void handleSkuStockCode(List<PmsSkuStock> skuStockList, Long productId) {
        if(CollectionUtils.isEmpty(skuStockList))return;
        for(int i=0;i<skuStockList.size();i++){
            PmsSkuStock skuStock = skuStockList.get(i);
            if(StringUtils.isEmpty(skuStock.getSkuCode())){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                StringBuilder sb = new StringBuilder();
                //Date
                sb.append(sdf.format(new Date()));
                //Four-digit product id
                sb.append(String.format("%04d", productId));
                //Three-digit index id
                sb.append(String.format("%03d", i+1));
                skuStock.setSkuCode(sb.toString());
            }
        }
    }

    @Override
    public PmsProductResult getUpdateInfo(Long id) {
        return productDao.getUpdateInfo(id);
    }

    @Override
    public int update(Long id, PmsProductParam productParam) {
        int count;
        //Update product information
        PmsProduct product = productParam;
        product.setId(id);
        productMapper.updateByPrimaryKeySelective(product);
        //Member price
        PmsMemberPriceExample pmsMemberPriceExample = new PmsMemberPriceExample();
        pmsMemberPriceExample.createCriteria().andProductIdEqualTo(id);
        memberPriceMapper.deleteByExample(pmsMemberPriceExample);
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), id);
        //Tiered price
        PmsProductLadderExample ladderExample = new PmsProductLadderExample();
        ladderExample.createCriteria().andProductIdEqualTo(id);
        productLadderMapper.deleteByExample(ladderExample);
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), id);
        //Full reduction price
        PmsProductFullReductionExample fullReductionExample = new PmsProductFullReductionExample();
        fullReductionExample.createCriteria().andProductIdEqualTo(id);
        productFullReductionMapper.deleteByExample(fullReductionExample);
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), id);
        //Modify SKU stock information
        handleUpdateSkuStockList(id, productParam);
        //Modify product parameters,Add custom product specifications
        PmsProductAttributeValueExample productAttributeValueExample = new PmsProductAttributeValueExample();
        productAttributeValueExample.createCriteria().andProductIdEqualTo(id);
        productAttributeValueMapper.deleteByExample(productAttributeValueExample);
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), id);
        //Associate topic
        CmsSubjectProductRelationExample subjectProductRelationExample = new CmsSubjectProductRelationExample();
        subjectProductRelationExample.createCriteria().andProductIdEqualTo(id);
        subjectProductRelationMapper.deleteByExample(subjectProductRelationExample);
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), id);
        //Associate preferred
        CmsPrefrenceAreaProductRelationExample prefrenceAreaExample = new CmsPrefrenceAreaProductRelationExample();
        prefrenceAreaExample.createCriteria().andProductIdEqualTo(id);
        prefrenceAreaProductRelationMapper.deleteByExample(prefrenceAreaExample);
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), id);
        count = 1;
        return count;
    }

    private void handleUpdateSkuStockList(Long id, PmsProductParam productParam) {
        //Current SKU information
        List<PmsSkuStock> currSkuList = productParam.getSkuStockList();
        //If there is currently no SKU, delete directly
        if(CollUtil.isEmpty(currSkuList)){
            PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
            skuStockExample.createCriteria().andProductIdEqualTo(id);
            skuStockMapper.deleteByExample(skuStockExample);
            return;
        }
        //Get initial SKU info
        PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
        skuStockExample.createCriteria().andProductIdEqualTo(id);
        List<PmsSkuStock> oriStuList = skuStockMapper.selectByExample(skuStockExample);
        //Get newly added SKU info
        List<PmsSkuStock> insertSkuList = currSkuList.stream().filter(item->item.getId()==null).collect(Collectors.toList());
        //Get the SKU info to be updated
        List<PmsSkuStock> updateSkuList = currSkuList.stream().filter(item->item.getId()!=null).collect(Collectors.toList());
        List<Long> updateSkuIds = updateSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
        //Get the SKU info to be deleted
        List<PmsSkuStock> removeSkuList = oriStuList.stream().filter(item-> !updateSkuIds.contains(item.getId())).collect(Collectors.toList());
        handleSkuStockCode(insertSkuList,id);
        handleSkuStockCode(updateSkuList,id);
        //Add sku
        if(CollUtil.isNotEmpty(insertSkuList)){
            relateAndInsertList(skuStockDao, insertSkuList, id);
        }
        //Delete sku
        if(CollUtil.isNotEmpty(removeSkuList)){
            List<Long> removeSkuIds = removeSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
            PmsSkuStockExample removeExample = new PmsSkuStockExample();
            removeExample.createCriteria().andIdIn(removeSkuIds);
            skuStockMapper.deleteByExample(removeExample);
        }
        //Modify sku
        if(CollUtil.isNotEmpty(updateSkuList)){
            for (PmsSkuStock pmsSkuStock : updateSkuList) {
                skuStockMapper.updateByPrimaryKeySelective(pmsSkuStock);
            }
        }

    }

    @Override
    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        if (!StringUtils.isEmpty(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }
        if (!StringUtils.isEmpty(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        if (productQueryParam.getBrandId() != null) {
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }
        return productMapper.selectByExample(productExample);
    }

    @Override
    public int updateVerifyStatus(List<Long> ids, Integer verifyStatus, String detail) {
        PmsProduct product = new PmsProduct();
        product.setVerifyStatus(verifyStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        List<PmsProductVertifyRecord> list = new ArrayList<>();
        int count = productMapper.updateByExampleSelective(product, example);
        //Insert a review record after modifying the review status
        for (Long id : ids) {
            PmsProductVertifyRecord record = new PmsProductVertifyRecord();
            record.setProductId(id);
            record.setCreateTime(new Date());
            record.setDetail(detail);
            record.setStatus(verifyStatus);
            record.setVertifyMan("test");
            list.add(record);
        }
        productVertifyRecordDao.insertList(list);
        return count;
    }

    @Override
    public int updatePublishStatus(List<Long> ids, Integer publishStatus) {
        PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateRecommendStatus(List<Long> ids, Integer recommendStatus) {
        PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateNewStatus(List<Long> ids, Integer newStatus) {
        PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateDeleteStatus(List<Long> ids, Integer deleteStatus) {
        PmsProduct record = new PmsProduct();
        record.setDeleteStatus(deleteStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if(!StringUtils.isEmpty(keyword)){
            criteria.andNameLike("%" + keyword + "%");
            productExample.or().andDeleteStatusEqualTo(0).andProductSnLike("%" + keyword + "%");
        }
        return productMapper.selectByExample(productExample);
    }

    /**
     * Establish and insert relation table operations
     *
     * @param dao       Operable dao
     * @param dataList  Data to insert
     * @param productId Establishing relations for id
     */
    private void relateAndInsertList(Object dao, List dataList, Long productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) return;
            for (Object item : dataList) {
                Method setId = item.getClass().getMethod("setId", Long.class);
                setId.invoke(item, (Long) null);
                Method setProductId = item.getClass().getMethod("setProductId", Long.class);
                setProductId.invoke(item, productId);
            }
            Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            LOGGER.warn("Error creating product:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

}
