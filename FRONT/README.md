# 실행 커맨드

npm install

npm install --save axios

npm install --save vuex-persist

npm install --save moment

npm install --save vue-browser-geolocation

npm install --save vue2-google-maps

npm install --save axios xml-js

npm install --save vue-chartjs chart.js

npm install --save free-google-image-search
: index.js 수정하기
//
// Copyright (c) 2017 by Fedir Bobylev. All Rights Reserved.
//

export default class GoogleImageSearch {

    /**
     * Function for image search
     *
     * @param  {string} query   Image search filed query
     * @return {Promise}        Returns a promise, with an array of found image URL's
     */
    static searchImage(query) {
        query = encodeURIComponent(query)

        return new Promise( (resolve, reject) => {

            // Fetches Items from Google Image Search URL
            fetch("https://www.google.com/search?source=lnms&sa=X&gbv=1&tbm=isch&q="+query)
            .then( res => res.text() )
            .then( res => {

                // Transforms HTML string into DOM object
                let parser = new DOMParser()
                parser = parser.parseFromString(res, "text/html")

                //console.log(parser)

                // Gets DOM element with image results
                let image = parser.querySelector("body > div:nth-child(4) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div > div > div > div > table > tbody > tr:nth-child(1) > td > a > div > img")

                //console.log(image.src)

                resolve(image.src)

                /*
                if (images.nodeName === "DIV") {

                    resolve(this.googleGetMobile(images))
                } else if (images.nodeName === "TABLE") {

                    resolve(this.googleGetDesktop(images))
                } else {

                    reject("Unknown System")
                }
                */

            })
            .catch( err => reject(err) )
        })
    }

    /**
     * Traverses DOM tree in mobile layout
     *
     * @param  {NodeList} images    Children of "ires" container
     * @return {Array}              Array of found images URL's
     */
    static googleGetMobile(images) {

        // Transforms DOM NodeList of images into Array.
        // Needed to use .map method
        images = Array.from(images.childNodes)

        // Maps Image Sources
        return images.map( (imgDiv) => {
            console.log(imgDiv.getAttribute("href"));
            return imgDiv.childNodes[0].src
        } )
    }

    /**
     * Traverses DOM tree in desktop layout
     *
     * @param  {NodeList} images    Children of "ires" container
     * @return {Array}              Array of found images URLs
     */
    static googleGetDesktop(images) {

        // NodeList of table rows
        images = images.childNodes[0].childNodes

        // Empty List of image URLs
        let imgSrc = []

        // Traverses table node for images
        images.forEach( (tRow) => {
            tRow = tRow.childNodes
            tRow.forEach( (tCol) => {
                let aLink = tCol.childNodes[0].childNodes[0]
                imgSrc.push(aLink.src)
            })
        } )

        return imgSrc
    }

}
