// Add your scripts here
// No need for dom ready because thanks to modules it behaves like defer
// Scope of this file is private, feel free to declare global vars

import './bootstrap.js';
import { $, $$ } from "./utils.js";

// No js stuff
const doc = document.documentElement;
doc.classList.remove("no-js");
doc.classList.add("js");

// Toasts
$$(".toast").forEach((toastNode) => {
    let toast = new Toast(toastNode);
    toast.show();
});

// Your code here
