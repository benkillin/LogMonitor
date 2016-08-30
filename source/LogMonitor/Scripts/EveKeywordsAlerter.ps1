Function MetricProcessor ([LogMonitor.FileChange] $change)
{
    If (!$change)
    {
        Throw "No change specified."
    }
	
    $metrics = @()

	if($change.Content.ToLower().contains("nickname".toLower()))
	{
		(new-object -ComObject wscript.shell).Popup("ALERT: nickname mentioned:\n\n" + $change.Content + $change.File, 0, "Done", 0x1);
		$metrics += [LogMonitor.Metric]::Create('nickname_mentioned', $change.Content + $change.File, [LogMonitor.MetricType]::Raw);
	}
	
    return $metrics
}