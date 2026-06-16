using { my.bookshop as bookshop } from '../db/schema';

service FirstSrv @(requires: 'authenticated-user') {

    entity BookSet 
    @(
        restrict: [
            { grant: ['READ', 'WRITE'], to : 'Admin'},
            { grant: ['READ'], to : 'Kids', where: 'booksAgeGroup=$user.booksAgeGroup' }
        ]
    )
    as projection on bookshop.Books;

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