/* togglePassword script for eye icon*/


    document.getElementById("togglePassword").addEventListener("change", function () {
        var passwordInput = document.getElementById("password");
        if (this.checked) {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    });


/* event listener for registration page error msg */
	    window.addEventListener("DOMContentLoaded", () => {
	        const errorMsg = document.querySelector(".error-msg");
	        if (errorMsg) {
	            setTimeout(() => {
	                errorMsg.style.display = "none";
	            }, 6000); // hides after 4 seconds
	        }
	    });
	
