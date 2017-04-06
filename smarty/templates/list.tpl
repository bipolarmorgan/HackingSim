{extends file="main.tpl"}
{block name=body}
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapse1">New Computer</a>
                </h4>
                <div id="collapse1" class="panel-collapse collapse">
                    <br/>
                    <form class="form-horizontal" method="POST" action="/admin/computer/">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ComputerHostName">Host Name:</label><input
                                    id="ComputerHostName" type="text"
                                    name="ComputerHostName"
                                    class="input-sm form-control"
                                    placeholder="Host Name">
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ComputerDomain">Domain Name:</label><input
                                    id="ComputerDomain" type="text"
                                    name="ComputerDomain"
                                    class="input-sm form-control"
                                    placeholder="Domain Name">
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ComputerIP">IP Address:</label><input
                                    id="ComputerIP" type="text"
                                    name="ComputerIP"
                                    class="input-sm form-control"
                                    placeholder="IP Address">
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="ComputerNetwork">Network:</label><select
                                    name="ComputerNetwork"
                                    id="ComputerNetwork"
                                    class="input-sm form-control">
                                {if isset($Computer)}
                                    {html_options options=$Networks selected=$Computer.NetworkID}
                                {else}
                                    {html_options options=$Networks}
                                {/if}
                            </select>
                        </div>
                        <button type=" submit" name="submit" value="Add" class="btn btn-default btn-small"><span
                                    class="glyphicon glyphicon-ok"/> Add
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <table id='computers' class="table table-striped table-hover table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Network</th>
            <th>IP</th>
        </tr>
        </thead>
        <tbody>
        {foreach $computers as $computer}
            <tr class='clickable-row' data-href='/admin/computer/{$computer.ComputerID}'>
                <td>{$computer.ComputerName}</td>
                <td>{$computer.NetworkName}</td>
                <td>{$computer.ComputerIP}</td>
                <td><span class="glyphicon glyphicon-pencil"/> <span class="glyphicon glyphicon-remove"/> <span
                            class="glyphicon glyphicon-cog"/></td>
            </tr>
        {/foreach}
        </tbody>
    </table>
{/block}
{block name=bottomScripts}
    <script>
        $(document).ready(function ($) {
            $(".clickable-row").click(function () {
                window.location = $(this).data("href");
            });
        });
        $(document).ready(function () {
            $('#computers').DataTable({
                "pageLength": 50,
                columnDefs: [{
                    targets: [0],
                    orderData: [1, 0]
                }]
            })
        });
    </script>
{/block}