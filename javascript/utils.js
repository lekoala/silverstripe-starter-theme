/**
 * @param {String|HTMLElement} selector
 * @param {HTMLElement|Document} base
 * @returns {HTMLElement|null}
 */
export function $(selector, base = document) {
    if (selector instanceof HTMLElement) {
        return selector;
    }
    return base.querySelector(selector);
}

/**
 * @param {String} selector
 * @param {Element|Document} base
 * @returns {Array<HTMLElement>}
 */
export function $$(selector, base = document) {
    return Array.from(base.querySelectorAll(selector));
}
