{extends file="main.tpl"}

{block name=body}
    <h3>{if isset($Computer.ComputerName)}Editing: {$Computer.ComputerName}{else}New Computer{/if}</h3>
    <form method="POST" action="/admin/computer/">
        <div class="form-group">
            <label for="computer_name">Host Name:</label><input id="computer_name" type="text" name="computer_name"
                                                                class="form-control" placeholder="Host Name"
                                                                {if isset($Computer.ComputerHostName)}value="{$Computer.ComputerHostName}">
            <input type="hidden" name="old_computer_name" value="{$Computer.ComputerHostName}"
                    {/if}>
        </div>
        <div class="form-group">
            <label for="domain_name">Domain Name:</label><input id="domain_name" type="text" name="domain_name"
                                                                class="form-control" placeholder="Domain Name"
                                                                {if isset($Computer.ComputerDomain)}value="{$Computer.ComputerDomain}">
            <input type="hidden" name="old_domain_name" value="{$Computer.ComputerDomain}"
                    {/if}>
        </div>
        <div class="form-group">
            <label for="computer_ip">IP Address:</label><input id="computer_ip" type="text" name="computer_ip"
                                                               class="form-control" placeholder="IP Address"
                                                               {if isset($Computer.ComputerIP)}value="{$Computer.ComputerIP}">
            <input type="hidden" name="old_computer_ip" value="{$Computer.ComputerIP}"
                    {/if}>
        </div>
        <div class="form-group">
            <label for="network_id">Network:</label><select name="network_id" id="network_id" class="form-control">
                {if isset($Computer)}
                <input type="hidden" name="old_network_id" value="{$Computer.NetworkID}>
                    {html_options options=$Networks selected=$Computer.NetworkID}
                {else}
                    {html_options options=$Networks}
                {/if}
            </select>
        </div>
        &nbsp;
        <button type=" submit" name="submit" value="{$task}" class="btn btn-default">{$task}</button>
    </form>
{/block}