Function MetricProcessor ([LogMonitor.FileChange] $change)
{
    If (!$change)
    {
        Throw "No change specified."
    }
	
    $metrics = @()

	if($change.Content.ToLower().contains("allcaps".toLower()))
	{
		(new-object -ComObject wscript.shell).Popup("ALERT: CAPITAL PING: " + $change.Content + $change.File, 0, "Done", 0x1);
		$metrics += [LogMonitor.Metric]::Create('directorbot_capital_ping', $change.Content + $change.File, [LogMonitor.MetricType]::Raw);
	}
		
	if($change.Content.ToLower().contains("TODO_supercap_ping_group_name".toLower()))
	{
		(new-object -ComObject wscript.shell).Popup("ALERT: SUPER CAPITAL PING!!!!!!" + $change.Content + $change.File, 0, "Done", 0x1);
		$metrics += [LogMonitor.Metric]::Create('directorbot_SUPER_capital_ping', $change.Content + $change.File, [LogMonitor.MetricType]::Raw);
	}
	
    return $metrics
}