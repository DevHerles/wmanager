// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

const activate = (oni) => {
    console.log("config activated")

    // Input 
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    oni.input.unbind("<c-p>")
    oni.input.unbind("<c-t>")

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
   "oni.loadInitVim"         : true,
   "tabs.mode"               : "tabs",
   "oni.useDefaultConfig"    : true,
   "editor.fontSize"         : "12px",
   "editor.fontFamily"       : "Monaco for Powerline",
   "editor.fontLigatures"    : true,
   "editor.completions.mode" : "oni",
   "oni.hideMenu"            : true,

   // "editor.quickOpen.execCommand": "fzf -f '${search}'",

   activate,
   deactivate,
   //add custom config here, such as
   //"oni.useDefaultConfig": true,
   //"oni.bookmarks": ["~/Documents",]
   //"oni.loadInitVim": false,
   //"editor.fontSize": "14px",
   //"editor.fontFamily": "Monaco"
}

