# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "daisyui" # @2.50.2
pin "buffer" # @2.0.1
pin "camelcase-css" # @2.0.1
pin "color" # @4.2.3
pin "color-convert" # @2.0.1
pin "color-name" # @1.1.4
pin "color-string" # @1.9.1
pin "css-selector-tokenizer" # @0.8.0
pin "cssesc" # @3.0.0
pin "fastparse" # @1.1.2
pin "fs" # @2.0.1
pin "is-arrayish" # @0.3.2
pin "nanoid/non-secure", to: "nanoid--non-secure.js" # @3.3.4
pin "path" # @2.0.1
pin "picocolors" # @1.0.0
pin "postcss" # @8.4.21
pin "postcss-js" # @4.0.1
pin "process" # @2.0.1
pin "simple-swizzle" # @0.2.2
pin "source-map-js" # @1.0.2
pin "tailwindcss/colors", to: "tailwindcss--colors.js" # @3.2.7
pin "tailwindcss/plugin", to: "tailwindcss--plugin.js" # @3.2.7
pin "url" # @2.0.1
pin "imask", to: "https://ga.jspm.io/npm:imask@6.4.3/esm/index.js"
