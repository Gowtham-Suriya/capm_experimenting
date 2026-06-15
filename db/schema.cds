using { managed, Language } from '@sap/cds/common';
namespace my.bookshop;

entity Books : managed {
    @title : 'Book Identifier'
    // @Common : { Label: 'Book Id' }
    key id : UUID;

    @title : 'Book Title'
    @Common.Label: 'Book Title in English'
    @mandatory
    title : String;
    author : String;

    @title : 'Book Price'
    @assert.range: [0.01, 9999.99]
    price : Decimal(9,2);

    language : Language;
}


