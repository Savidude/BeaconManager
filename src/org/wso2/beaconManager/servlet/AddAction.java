package org.wso2.beaconManager.servlet;

import org.wso2.beaconManager.database.ActionTable;
import org.wso2.beaconManager.database.LocationTable;
import org.wso2.beaconManager.database.ProfileTable;
import org.wso2.beaconManager.database.impl.ActionTableImpl;
import org.wso2.beaconManager.database.impl.LocationTableImpl;
import org.wso2.beaconManager.database.impl.ProfileTableImpl;
import org.wso2.beaconManager.util.Action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;


@WebServlet(urlPatterns = "/add_action")
public class AddAction extends HttpServlet {
    private ProfileTable profileTable;
    private LocationTable locationTable;
    private ActionTable actionTable;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        profileTable = new ProfileTableImpl();
        Map<Integer, String> profiles = profileTable.getAllProfiles();
        request.setAttribute("profileSet", getOptions(profiles));

        locationTable = new LocationTableImpl();
        Map<Integer, String> locations = locationTable.getAllLocations();
        request.setAttribute("locationSet", getOptions(locations));

        request.getRequestDispatcher("WEB-INF/views/addAction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Action action = new Action();
        action.setProfileId(Integer.parseInt(request.getParameter("profile")));
        action.setLocationId(Integer.parseInt(request.getParameter("location")));
        action.setType(request.getParameter("type"));
        action.setValue(request.getParameter("value"));

        actionTable = new ActionTableImpl();
        boolean status = actionTable.addAction(action);

        if(status){
            response.getWriter().println("Success");
        }else {
            response.getWriter().println("Error");
        }
    }

    private String getOptions(Map<Integer, String> values){
        String option = "<option value=\"%d\">%s</option>";
        String optionSet = "";
        Iterator iterator = values.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry pair = (Map.Entry)iterator.next();
            optionSet += String.format(option, pair.getKey(), pair.getValue());
        }
        return optionSet;
    }
}
