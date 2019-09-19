package com.aaa.lee.rent.utils;

import com.aaa.lee.rent.status.StatusEnum;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.action.ActionFuture;
import org.elasticsearch.action.admin.indices.create.CreateIndexResponse;
import org.elasticsearch.action.admin.indices.delete.DeleteIndexResponse;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsRequest;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.text.Text;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/8/10 15:48
 * @Description
 *      1.把整个项目标准化，方便了程序员的开发(把所有的返回值进行标准化)
 *      ES的工具类
 **/
//@Component
public class ESUtil {

    @Autowired
    private TransportClient transportClient;

    private static TransportClient client;

    /**
     * 统一定义返回结果
     * resultMap:需要放入两个参数(code, msg)
     * resultMap中最多只有两个值
     *  code:返回的编码
     *  msg:返回编码所对应的信息
     */
    public static Map<String, String> resultMap = new HashMap<String, String>();

    /**
     * @PostContruct是spring框架的注解 spring容器初始化的时候执行该方法
     */
    @PostConstruct
    public void init() {
        client = this.transportClient;
    }

    /**
     * 创建索引
     *
     * @param index
     * @return
     */
    public static Map<String, String> createIndex(String index) {
        if (isIndexExist(index)) {
            // 表示索引存在
            resultMap.put("code", StatusEnum.EXIST.getCode());
            resultMap.put("msg", StatusEnum.EXIST.getMsg());
            return resultMap;
        }
        CreateIndexResponse indexresponse = client.admin().indices().prepareCreate(index).execute().actionGet();
        boolean bResult = indexresponse.isAcknowledged();
        if(bResult) {
            resultMap.put("code", StatusEnum.SUCCESS.getCode());
            resultMap.put("msg", StatusEnum.SUCCESS.getMsg());
        } else {
            resultMap.put("code", StatusEnum.FAILED.getCode());
            resultMap.put("msg", StatusEnum.FAILED.getMsg());
        }
        return resultMap;
    }

    /**
     * 删除索引
     *
     * @param index
     * @return
     */
    public static Map<String, String> deleteIndex(String index) {
        if (isIndexExist(index)) {
            // 表示索引存在
            resultMap.put("code", StatusEnum.EXIST.getCode());
            resultMap.put("msg", StatusEnum.EXIST.getMsg());
            return resultMap;
        }
        DeleteIndexResponse dResponse = client.admin().indices().prepareDelete(index).execute().actionGet();
        if (dResponse.isAcknowledged()) {
            resultMap.put("code", StatusEnum.SUCCESS.getCode());
            resultMap.put("msg", StatusEnum.SUCCESS.getMsg());
        } else {
            resultMap.put("code", StatusEnum.FAILED.getCode());
            resultMap.put("msg", StatusEnum.FAILED.getMsg());
        }
        return resultMap;
    }

    /**
     * 判断索引是否存在
     *
     * @param index
     * @description
     *      isExists():代表检测索引是否存在，如果存在返回true，如果不存在返回false
     * @return
     */
    public static boolean isIndexExist(String index) {
        IndicesExistsResponse inExistsResponse = client.admin().indices().exists(new IndicesExistsRequest(index)).actionGet();
        return inExistsResponse.isExists();
    }

    /**
     * @Author: LX
     * @Description: 判断inde下指定type是否存在
     * @Date: 2018/11/6 14:46
     * @Modified by:
     */
    public boolean isTypeExist(String index, String type) {
        return isIndexExist(index)
                ? client.admin().indices().prepareTypesExists(index).setTypes(type).execute().actionGet().isExists()
                : false;
    }

    /**
     * 数据添加，正定ID
     *
     * @param mapObj 要增加的数据
     * @param index      索引，类似数据库
     * @param type       类型，类似表
     * @param id         数据ID
     * @return
     */
    public static Map<String, String> addData(Map<String, Object> mapObj, String index, String type, String id) {
        IndexResponse response = client.prepareIndex(index, type, id).setSource(mapObj).get();
        // OK: 添加成功
        // FAILED: 添加失败
        String result = response.status().toString();
        if("OK".equals(result.toUpperCase())) {
            resultMap.put("code", StatusEnum.SUCCESS.getCode());
            resultMap.put("msg", StatusEnum.SUCCESS.getMsg());
        } else {
            resultMap.put("code", StatusEnum.FAILED.getCode());
            resultMap.put("msg", StatusEnum.FAILED.getMsg());
        }
        return resultMap;
    }

    /**
     * 数据添加
     *
     * @param mapObj 要增加的数据
     * @param index      索引，类似数据库
     * @param type       类型，类似表
     * @return
     */
    public static Map<String, String> addData(Map<String, Object> mapObj, String index, String type) {
        return addData(mapObj, index, type, UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
    }

    /**
     * 通过ID删除数据
     *
     * @param index 索引，类似数据库
     * @param type  类型，类似表
     * @param id    数据ID
     */
    public static Map<String, String> deleteDataById(String index, String type, String id) {

        DeleteResponse response = client.prepareDelete(index, type, id).execute().actionGet();
        String result = response.status().toString();
        if("OK".equals(result.toUpperCase())) {
            resultMap.put("code", StatusEnum.SUCCESS.getCode());
            resultMap.put("msg", StatusEnum.SUCCESS.getMsg());
        } else {
            resultMap.put("code", StatusEnum.FAILED.getCode());
            resultMap.put("msg", StatusEnum.FAILED.getMsg());
        }
        return resultMap;
    }

    /**
     * 通过ID 更新数据
     *
     * @param mapObj 要增加的数据
     * @param index      索引，类似数据库
     * @param type       类型，类似表
     * @param id         数据ID
     * @return
     */
    public static Map<String, String> updateDataById(Map<String, Object> mapObj, String index, String type, String id) {

        UpdateRequest updateRequest = new UpdateRequest();

        updateRequest.index(index).type(type).id(id).doc(mapObj);

        ActionFuture<UpdateResponse> update = client.update(updateRequest);
        String result = update.actionGet().status().toString();
        if("OK".equals(result.toUpperCase())) {
            resultMap.put("code", StatusEnum.SUCCESS.getCode());
            resultMap.put("msg", StatusEnum.SUCCESS.getMsg());
        } else {
            resultMap.put("code", StatusEnum.FAILED.getCode());
            resultMap.put("msg", StatusEnum.FAILED.getMsg());
        }
        return resultMap;

    }

    /**
     * 通过ID获取数据
     *
     * @param index  索引，类似数据库
     * @param type   类型，类似表
     * @param id     数据ID
     * @param fields 需要显示的字段，逗号分隔（缺省为全部字段）
     * @return
     */
    public static Map<String, Object> searchDataById(String index, String type, String id, String fields) {

        GetRequestBuilder getRequestBuilder = client.prepareGet(index, type, id);

        if (StringUtils.isNotEmpty(fields)) {
            getRequestBuilder.setFetchSource(fields.split(","), null);
        }

        GetResponse getResponse = getRequestBuilder.execute().actionGet();

        return getResponse.getSource();
    }


    /**
     * 使用分词查询
     *
     * @param index          索引名称
     * @param type           类型名称,可传入多个type逗号分隔
     * @param query          查询条件
     * @param size           查询多少条数据
     * @param fields         需要显示的字段，逗号分隔（缺省为全部字段）
     * @param sortField      排序字段
     * @param highlightField 高亮字段
     * @return
     */
    public static List<Map<String, Object>> searchListData(
            String index, String type, QueryBuilder query, Integer size,
            String fields, String sortField, String highlightField) {

        SearchRequestBuilder searchRequestBuilder = client.prepareSearch(index);
        if (StringUtils.isNotEmpty(type)) {
            searchRequestBuilder.setTypes(type.split(","));
        }

        if (StringUtils.isNotEmpty(highlightField)) {
            HighlightBuilder highlightBuilder = new HighlightBuilder();
            // 设置高亮字段
            highlightBuilder.field(highlightField);
            searchRequestBuilder.highlighter(highlightBuilder);
        }

        searchRequestBuilder.setQuery(query);

        if (StringUtils.isNotEmpty(fields)) {
            searchRequestBuilder.setFetchSource(fields.split(","), null);
        }
        searchRequestBuilder.setFetchSource(true);

        if (StringUtils.isNotEmpty(sortField)) {
            searchRequestBuilder.addSort(sortField, SortOrder.DESC);
        }

        if (size != null && size > 0) {
            searchRequestBuilder.setSize(size);
        }


        SearchResponse searchResponse = searchRequestBuilder.execute().actionGet();

        long totalHits = searchResponse.getHits().totalHits;
        long length = searchResponse.getHits().getHits().length;


        if (searchResponse.status().getStatus() == 200) {
            // 解析对象
            return setSearchResponse(searchResponse, highlightField);
        }
        return null;

    }


    /**
     * 高亮结果集 特殊处理
     *
     * @param searchResponse
     * @param highlightField
     */
    private static List<Map<String, Object>> setSearchResponse(SearchResponse searchResponse, String highlightField) {
        List<Map<String, Object>> sourceList = new ArrayList<Map<String, Object>>();
        StringBuffer stringBuffer = new StringBuffer();

        for (SearchHit searchHit : searchResponse.getHits().getHits()) {
            searchHit.getSourceAsMap().put("id", searchHit.getId());

            if (StringUtils.isNotEmpty(highlightField)) {

                System.out.println("遍历 高亮结果集，覆盖 正常结果集" + searchHit.getSourceAsMap());
                Text[] text = searchHit.getHighlightFields().get(highlightField).getFragments();

                if (text != null) {
                    for (Text str : text) {
                        stringBuffer.append(str.string());
                    }
                    //遍历 高亮结果集，覆盖 正常结果集
                    searchHit.getSourceAsMap().put(highlightField, stringBuffer.toString());
                }
            }
            sourceList.add(searchHit.getSourceAsMap());
        }
        return sourceList;
    }

}
