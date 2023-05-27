/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.listener;

import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import thainq.unit.PropertiesFileHelper;

/**
 * Web application lifecycle listener.
 *
 * @author PC
 */
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        String siteMapLocation = context.getInitParameter("SITEMAP_PROPERTIES_FILE_LOCATION");
        Properties siteMapProperties = PropertiesFileHelper.getProperties(context, siteMapLocation);
        context.setAttribute("SITE_MAP", siteMapProperties);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
