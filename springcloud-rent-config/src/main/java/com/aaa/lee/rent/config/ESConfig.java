package com.aaa.lee.rent.config;

import com.aaa.lee.rent.properties.ESProperties;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @Company AAA软件教育
 * @Author Seven Lee
 * @Date Create in 2019/9/5 10:41
 * @Description
 **/
//@SpringBootApplication
public class ESConfig {

    @Autowired
    private ESProperties esProperties;

    @Bean("transportClient")
    public TransportClient getTransportClient() {
        // 1.创建TransportClient对象
        TransportClient transportClient = null;
        try {
            // 2.设置Java对ES的集群信息
            Settings settings = Settings.builder().put("cluster.name", esProperties.getClusterName())
                    .put("node.name", esProperties.getNodeName())
                    .put("client.transport.sniff", true)
                    .put("thread_pool.search.size", esProperties.getPool()).build();
            // 3.初始化TransportClient对象
            transportClient = new PreBuiltTransportClient(settings);
            // 4.配置对ES的连接信息
            TransportAddress transportAddress = new TransportAddress(InetAddress.getByName(esProperties.getIp()), Integer.parseInt(esProperties.getPort()));
            // 5.把对ES的连接对象放到transportClient对象中
            transportClient.addTransportAddress(transportAddress);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return transportClient;
    }

}
