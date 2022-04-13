component {

    this.name = 'antisamy_with_lucee_far_jar_demo';

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
