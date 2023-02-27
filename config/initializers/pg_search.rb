PgSearch.multisearch_options = {
  # using: [tsearch: { dictionary: :english }]
  using: {
    tsearch: {
      dictionary: "english",
      prefix: true
    }
  }
}
