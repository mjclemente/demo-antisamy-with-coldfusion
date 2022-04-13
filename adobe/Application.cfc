component {

    this.name = 'antisamy_with_acf_demo';

    public boolean function onApplicationStart() {
        var antiSamyJarArray = directoryList(
            expandPath('./lib'),
            true,
            'path',
            '*.jar',
            'name',
            'file'
        );
        application.javaLoaderFactory = new javaLoaderFactory();

        application.antisamyJavaLoader = application.javaLoaderFactory.getJavaLoader(antiSamyJarArray);
        return true;
    }

}
