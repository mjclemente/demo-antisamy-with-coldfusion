component {

    this.name = 'antisamy_with_lucee_demo';

    this.javaSettings = {
        loadPaths: directoryList(
            expandPath('./lib'),
            true,
            'path',
            '*.jar',
            'name',
            'file'
        )
    };

}
