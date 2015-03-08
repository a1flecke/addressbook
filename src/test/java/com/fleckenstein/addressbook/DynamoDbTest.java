package com.fleckenstein.addressbook;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Table;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;
import java.util.Properties;

public class DynamoDbTest {
    private String accessKey;
    private String secretKey;

    @Before
    public void setup() throws Exception{
        Properties props = getEnvProperties();
        accessKey = props.getProperty(Constants.AWS_ACCESS_KEY);
        secretKey = props.getProperty(Constants.AWS_SECRET_KEY);
    }

    @Test
    public void testDbAccess(){
        DynamoDB dynamoDB = new DynamoDB(new AmazonDynamoDBClient(new BasicAWSCredentials(accessKey, secretKey)));
        Table table = dynamoDB.getTable(Constants.ENTRY_TABLE);
        String tableName = table.getTableName();
    }

    private Properties getEnvProperties() throws Exception{
        Properties properties = new Properties();
        InputStream is = getClass().getClassLoader().getResourceAsStream(Constants.ENV_FILE);
        properties.load(is);
        return properties;
    }
}
