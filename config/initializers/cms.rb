Cms::CompressionConfig.initialize_compression(html_compress: false)
Cms::AssetsPrecompile.initialize_precompile
Cms.config.provided_locales do
  [:uk, :en]
end

Cms.config.use_translations true

IMAGE_OPTIONS = {styles: { large: "1380x700#", square: "450x450#", wide: "900x450#", medium_square: "680x680#", medium_tall: "680x1040#", small_wide: "680x360", small_square: "330x330#" }}