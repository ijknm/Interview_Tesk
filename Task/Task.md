 ----- Interview Task ------

   Three Pages are implemeted in Task Project:

   We used Google Books url(https://www.googleapis.com/books/v1/volumes?q=stephen+king)

   1. Sign In Page:

      - Sign in page as two test field represent email-Id and password.
      - Emaild validation done. (should as @gmail.com formate)
      - Password Validation done. (atleast 8 characters, 1 uppercase and 1 number and 1 special charecter)

   2. List View:

      - Implemeted Table view with custome cells.
      - Each cell data is loaded from https://www.googleapis.com/books/v1/volumes?q=stephen+king
      - Books images also loading from thumBookImage URL.
      - Image URl are loading HTTP host.

   3. Deatil View:

      - List View selecated data are sent to details. (Disply details about book)
 
Sample Data Formate:

  volumeInfo =     {
  
        allowAnonLogging = 1;
        authors =         (
            "Stephen King"
        );
        averageRating = "3.5";
        canonicalVolumeLink = "https://market.android.com/details?id=book-KOPSjMuVN4kC";
        categories =         (
            Fiction
        );
        contentVersion = "0.8.6.0.preview.2";
        description = "An exciting reissue of Stephen King's debut novel about an outcast teenager with a frightening power which put him on the map and set him on his journey as a household name. Carrie White is no ordinary girl. Carrie White has the gift of telekinesis. To be invited to Prom Night by Tommy Ross is a dream come true for Carrie - the first step towards social acceptance by her high school colleagues. But events will take a decidedly macabre turn on that horrifying and endless night as she is forced to exercise her terrible gift on the town that mocks and loathes her . . .";
        imageLinks =         {
            smallThumbnail = "http://books.google.com/books/content?id=KOPSjMuVN4kC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
            thumbnail = "http://books.google.com/books/content?id=KOPSjMuVN4kC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api";
        };
        industryIdentifiers =         (
                        {
                identifier = 9781848940802;
                type = "ISBN_13";
            },
                        {
                identifier = 1848940807;
                type = "ISBN_10";
            }
        );
        infoLink = "https://play.google.com/store/books/details?id=KOPSjMuVN4kC&source=gbs_api";
        language = en;
        maturityRating = "NOT_MATURE";
        pageCount = 256;
        panelizationSummary =         {
            containsEpubBubbles = 0;
            containsImageBubbles = 0;
        };
        previewLink = "http://books.google.co.in/books?id=KOPSjMuVN4kC&printsec=frontcover&dq=stephen+king&hl=&cd=1&source=gbs_api";
        printType = BOOK;
        publishedDate = "2007-05-31";
        publisher = "Hachette UK";
        ratingsCount = 2486;
        readingModes =         {
            image = 0;
            text = 1;
        };
        title = Carrie;
    };
 

