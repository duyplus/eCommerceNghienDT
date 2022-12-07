package nghiendt.controller;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;

@RestController
public class LogsController {

    @RequestMapping("logs")
    public static String[] logs() throws URISyntaxException, IOException {
        File f = new File("src/main/resources/logs/");
        FilenameFilter filter = new FilenameFilter() {
            @Override
            public boolean accept(File f, String name) {
                return name.endsWith(".log");
            }
        };
        return f.list(filter);
    }

    @GetMapping("/logs/application")
    public void fetchLogs(HttpServletResponse response) throws IOException {
        DefaultResourceLoader loader = new DefaultResourceLoader();
        InputStream is = loader.getResource("classpath:logs/nghiendt.log").getInputStream();
        IOUtils.copy(is, response.getOutputStream());
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "filename=nghiendt.log");
        response.flushBuffer();
    }

//    @RequestMapping("/logs/properties")
//    public static void fetchProperties(HttpServletResponse response) throws IOException {
//        DefaultResourceLoader loader = new DefaultResourceLoader();
//        InputStream is = loader.getResource("classpath:application.properties").getInputStream();
//        IOUtils.copy(is, response.getOutputStream());
//        response.setContentType("text/plain");
//        response.setHeader("Content-Disposition", "filename:application.properties");
//        response.flushBuffer();
//    }
}
