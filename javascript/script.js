// Add your scripts here
// No need for dom ready because thanks to modules it behaves like defer
// Scope of this file is private, feel free to declare global vars

import Toast from "./vendor/bootstrap/src/toast";

// No js stuff
document.documentElement.classList.remove('no-js');
document.documentElement.classList.add('js');

// Toasts
Array.from(document.querySelectorAll(".toast")).forEach((toastNode) => {
    let toast = new Toast(toastNode);
    toast.show();
});
