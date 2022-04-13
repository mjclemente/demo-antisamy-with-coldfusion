<cfscript>
  html = fileRead(expandPath('./unsafe.html'));
  antisamy = createObject('java', 'org.owasp.validator.html.AntiSamy');
  policy = expandPath('./policy.xml')
  scan = antisamy.scan(html, policy);

  errors = scan.getErrorMessages();
  cleanHtml = scan.getCleanHTML();
  writeDump(var = {'original': html, 'clean': cleanHtml}, label = 'Clean HTML');
  writeDump(var = errors, label = 'Errors');
</cfscript>
