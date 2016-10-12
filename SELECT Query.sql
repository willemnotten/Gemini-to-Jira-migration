SELECT 
    Issues.[summary] AS 'Summary'
	  ,'Issue key' AS 'Issue key'
	  ,Issues.[issueid] AS 'Issueid'
	  ,'Parent id' AS 'Parent id'
    ,IssueType.[typedesc] AS 'Issue Type'
	  ,IssueStatus.[statusdesc]	AS 'Status'
	  ,'WP' AS 'Project key'
	  ,'WP' AS 'Project name'
	  ,'Software' AS 'Project type' 
	  ,'Project lead' AS 'Project lead'
	  ,'' AS 'Project description'
	  ,'' AS 'Project url'
    ,IssuePrio.[prioritydesc] AS 'Priority'
    ,'' AS 'Resolution'
	  ,'' AS 'Assignee'
    ,Users.[username] AS 'Reporter'
	  ,Users.[username] AS 'Creator'
	  ,CURRENT_TIMESTAMP as 'Created'
	  ,CURRENT_TIMESTAMP as 'Updated'
	  ,CURRENT_TIMESTAMP as 'Last Viewed'
	  ,'' AS 'Resolved'
	  ,'' AS 'Fix Version/s'
	  ,'' AS 'Due date'
	  ,0 AS 'Votes'
	  ,'' AS 'Labels'
	  ,'Keywords' AS 'Description'
	  ,'' AS 'Environment'
	  ,Users.[username] AS 'Watchers'
	  ,'' AS 'Watchers'
	  ,'' AS 'Original Estimate'
	  ,'' AS 'Remaining Estimate'
	  ,'' AS 'Time spent'
	  ,'' AS 'Work ratio'
	  ,'' AS 'Original Estimate'
	  ,'' AS 'Remaining Estimate'
	  ,'' AS 'Time spent'
	  ,'' AS 'Security level'
	  ,'' AS 'Outward issue link (Blocks)'
	  ,'' AS 'Attachment'
  	  ,'' AS 'Custom field (Account)'
  	  ,'' AS 'Custom field (Epic Color)'
  	  ,'' AS 'Custom field (Epic Link)'
  	  ,'' AS 'Custom field (Epic Name)'
  	  ,'' AS 'Custom field (Epic Status)'
  	  ,'' AS 'Custom field (Iteration)'
  	  ,'' AS 'Custom field (Parent Link)'
  	  ,'' AS 'Custom field (Raised during)'
  	  ,'' AS 'Custom field (Rank)'
  	  ,'' AS 'Custom field (Ready)'
  	  ,'' AS 'Custom field (Story Points)'
  	  ,'' AS 'Custom field (Team)'
  	  ,'' AS 'Custom field (Test sessions)'
  	  ,'' AS 'Custom field (Testing status)'
  	  ,'' AS 'Custom field ([CHART] Date of First Response)'
  	  ,/*ISNULL(Comments.[comment], NULL)*/ '' AS 'Comment'
  	  ,/*ISNULL(Attachments.[thefilename], NULL)*/ '' AS 'Attachments'  	  
  FROM [Gemini].[dbo].[gemini_issues] Issues
	INNER JOIN [Gemini].[dbo].[gemini_Projects] Projects ON Issues.[projectid] = Projects.[projectid]  
	INNER JOIN [Gemini].[dbo].[gemini_users] Users ON Issues.[reportedby] = Users.[userid]
	INNER JOIN [Gemini].[dbo].[gemini_issuetypes] IssueType ON Issues.[issuetypeid] = IssueType.[typeid]
	INNER JOIN [Gemini].[dbo].[gemini_issuepriorities] IssuePrio ON Issues.[issuepriorityid] = IssuePrio.[priorityid]
	INNER JOIN [Gemini].[dbo].[gemini_issuestatus] IssueStatus ON Issues.[issuestatusid] = IssueStatus.[statusid]
	INNER JOIN [Gemini].[dbo].[gemini_issues] ParentIssues ON Issues.[issueid] = ParentIssues.[issueid]
	/*LEFT OUTER JOIN (
				SELECT
				  Comments.[issueid]
				  ,Comments.[comment]
				FROM [Gemini].[dbo].[gemini_issuecomments] Comments							
			  ) AS Comments ON Comments.[issueid] = issues.[issueid]
	LEFT OUTER JOIN (
				SELECT
				  Attachments.[issueid]
				  ,Attachments.[thefilename]
				FROM [Gemini].[dbo].[gemini_issueattachments] Attachments
			  ) AS Attachments ON Attachments.[issueid] = issues.[issueid]*/
