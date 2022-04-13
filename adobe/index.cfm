<cfscript>
  html = fileRead(expandPath('./unsafe.html'));
  antisamy = application.antisamyJavaLoader.create('org.owasp.validator.html.AntiSamy').init();
  // https://www.bennadel.com/blog/3451-using-the-owasp-antisamy-1-5-7-project-with-coldfusion-10-to-sanitize-html-input-and-help-prevent-xss-attacks.htm
  policy = application.antisamyJavaLoader.switchThreadContextClassLoader(
      (PolicyClass, policyFilePath) => PolicyClass.getInstance(javacast('string', policyFilePath)),
      {
          PolicyClass: application.antisamyJavaLoader.create('org.owasp.validator.html.Policy'),
          policyFilePath: expandPath('./policy.xml')
      }
  );
  scan = antisamy.scan(html, policy);

  errors = scan.getErrorMessages();
  cleanHtml = scan.getCleanHTML();
  writeDump(var = {'original': html, 'clean': cleanHtml}, label = 'Clean HTML');
  writeDump(var = errors, label = 'Errors');
</cfscript>
