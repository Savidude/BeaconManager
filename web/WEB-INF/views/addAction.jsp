<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Beacon Manager</title>
        <script src="js/valueChange.js"></script>
    </head>

    <body>
        <h3>Add action</h3>

        <form id="actionForm" method="POST" action="/add_action">
            <table>
                <tr>
                    <td>Profile &nbsp&nbsp</td>
                    <td>
                        <select id="profile" name="profile">
                            ${profileSet}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Location &nbsp&nbsp</td>
                    <td>
                        <select id="location" name="location">
                            ${locationSet}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Action type &nbsp&nbsp</td>
                    <td>
                        <select id="typeSelect" name="type" onchange="selectActions()">
                            <option value="image">Display image</option>
                            <option value="url">Send URL</option>
                            <option value="endpoint">Call backend endpoint</option>
                        </select>
                    </td>
                </tr>
            </table>

            <div id="urlDiv" style="display: none">
                <input type="text" name="value" placeholder="Value"/>
            </div>

            <div id="endpointDiv" style="display: none">
                <select id="requestSelect" name="requestType">
                    <option value="get">GET</option>
                    <option value="post">POST</option>
                    <option value="put">PUT</option>
                    <option value="delete">DELETE</option>
                </select>

                <input type="text" name="requestUrl" placeholder="Enter requested URL"/>
                <br>

                <div id="dynamicInput">
                    <input type="text" name="keys" placeholder="key" autocomplete="off"/> &nbsp
                    <input type="text" name="values" placeholder="value" list="presetParam" autocomplete="off">
                        <datalist id="presetParam">
                            <option value="$profile">$profile</option>
                            <option value="$location">$location</option>
                            <option value="$user">$user</option>
                        </datalist>
                </div>
                <input type="button" value="+" onClick="addInput('dynamicInput');">
            </div>

            <br>
            <input id="submitButton" type="submit" style="display: none">
        </form>

        <div id="imageDiv" style="display: block">
            <form id="uploadForm" action="/upload" method="POST" enctype="multipart/form-data">
                <input type="file" name="image"> &nbsp
                <input type="submit" value="upload" onclick="upload()">

                <div id="container"/>
                <input type="hidden" name="profileHidden" id="profileHidden">
                <input type="hidden" name="locationHidden" id="locationHidden">
                <input type="hidden" name="typeHidden" id="typeHidden">
            </form>
        </div>
    </body>
</html>
