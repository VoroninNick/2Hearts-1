Cms::CompressionConfig.initialize_compression(html_compress: false)
Cms::AssetsPrecompile.initialize_precompile
Cms.config.provided_locales do
  [:uk, :en]
end

Cms.config.use_translations true