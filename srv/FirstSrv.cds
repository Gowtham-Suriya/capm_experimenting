using { my.bookshop as bookshop } from '../db/schema';

service FirstSrv {
    entity BookSet as projection on bookshop.Books;

    action increasePrice(percentage : Integer);
}

annotate FirstSrv.BookSet with @(
    UI:{
        SelectionFields: [id , title, author],
        LineItem: [
            {$Type: 'UI.DataField', Value: id},
            {$Type: 'UI.DataField', Value: title},
        ]
    }
);