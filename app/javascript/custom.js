window.onload = function() {
    //if we found the element
    if(document.readyState == "complete") {
        if (document.getElementById("reviewButton")) {
            var reviewDiv = document.getElementById("reviewDiv");

            document.getElementById("reviewButton").addEventListener("click", function () {

                if(reviewDiv.getAttribute("class").includes("d-none")) {
                    reviewDiv.setAttribute("class", "reviewsBox");
                }
                else if(!reviewDiv.getAttribute("class").includes("d-none")){
                    reviewDiv.setAttribute("class", "d-none");
                }
            });
        }
    }

    if(document.getElementById("deleteReviewBtn")) {
        document.getElementById("deleteReviewBtn").addEventListener("click", function () {
            if(confirm("Are you sure you want to delete this review?")) {
                document.getElementById("deleteReviewForm").submit();
            }
        });
    }
}

window.onbeforeunload = function() {
    if(document.getElementById("reviewButton")) {
        var reviewDiv = document.getElementById("reviewDiv");
        reviewDiv.hidden = true;
    }
}