sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"mylearningcapmproj/test/integration/pages/BookSetList",
	"mylearningcapmproj/test/integration/pages/BookSetObjectPage"
], function (JourneyRunner, BookSetList, BookSetObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('mylearningcapmproj') + '/test/flpSandbox.html#mylearningcapmproj-tile',
        pages: {
			onTheBookSetList: BookSetList,
			onTheBookSetObjectPage: BookSetObjectPage
        },
        async: true
    });

    return runner;
});

