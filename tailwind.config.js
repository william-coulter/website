module.exports = {
    // https://gist.github.com/ninrod/b0f86d77ebadaccf7d9d4431dd8e2983
    purge: ['./src/**/*.elm', './public/index.html'],
    content: ['./src/**/*.elm'],
    theme: {
        extend: {
            colors: {
                "solarized-dark": {
                    base02: "#073642",
                    base03: "#002b36",
                },
            },
            textColor: {
                heading1: "#d33682",
                heading2: "#859900",
                primary: "#eee8d5",
            },
            borderColor: {
                primary: "#eee8d5",
            },
        },
    },
    plugins: [],
}
