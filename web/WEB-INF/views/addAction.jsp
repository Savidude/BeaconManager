<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Beacon Manager</title>
    </head>

    <body>
        <h3>Add action</h3>

        <form method="POST" action="/add_action">
            <table>
                <tr>
                    <td>Profile &nbsp&nbsp</td>
                    <td>
                        <select name="profile">
                            ${profileSet}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Location &nbsp&nbsp</td>
                    <td>
                        <select name="location">
                            ${locationSet}
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Action type &nbsp&nbsp</td>
                    <td>
                        <select name="type">
                            <option value="image">Display image</option>
                            <option value="url">Send URL</option>
                            <option value="endpoint">Call backend endpoint</option>
                        </select>
                    </td>
                </tr>
            </table>

            <input type="text" name="value" placeholder="Value"/>
            <br><br>
            <input type="submit">
        </form>
    </body>
</html>
