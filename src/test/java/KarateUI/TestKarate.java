package com.intuit.karate.LearnUIAutomation;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
/*
import java.io.File;
import java.util.Collection;

@KarateOptions(tags={"@ignore"},features="classpath:")
public class TestKarate {
    @Karate.Test
    public void testParallel() {
       Results results = Runner.parallel(getClass(), 1);
        generateReport(results.getReportDir());
    }
    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles= FileUtils.listFiles(new File(karateOutputPath),new
        final List<String>jsonPaths=new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file->jsonPaths.add(file.getAbsolutePath()));
        Configuration config=new Configuration(new File("target"),"demo");
        ReportBuilder reportBuilder=new ReportBuilder(jsonPaths,config);
        reportBuilder.generateReports();
    }

 */
