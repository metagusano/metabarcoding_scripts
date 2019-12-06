#' Complete list of palettes
#'
#' Use \code{\link{polyclad_palette}} to construct palettes of desired length.
#'
#' @export
polyclad_palettes <- list(
  bimarginatus = c("#d1cec9", "#9a7290", "#be4817", "#1a0c01", "#e2e135"),
  jebborum = c("#b69960", "#342a25", "#cec5a7", "#737243", "#dad46c"),
  stimpsoni = c("#887055", "#493c2f", "#b9b8af", "#6c6a66", "#9c7d41"),
  bifurcus = c("#6d95bb", "#98a7b5", "#606977", "#ba9598", "#d96238", "#423657"),
  nigropunctatus = c("#a4683c", "#7e3b2a", "#675143", "#281b17", "#dac371", "#c4673b"),
  murinus = c("#90683d", "#aea7a3", "#7b341e", "#c3a355", "#3f3b3e"),
  torquatum = c("#956f3c", "#98846a", "#080603", "#564e47", "#5b321b"),
  ferrugineus = c("#893a7c", "#700721", "#eda128", "#c9511c", "#96171b"),
  lindae = c("#2f1e33", "#cd9b51", "#859ba7", "#204f92", "#f0a835", "#a35046"),
  auranticrinis = c("#bc783b", "#853220", "#bbb9d4", "#8491c0", "#ad888d", "#e37736"),
  dimidiatus = c("#17130b", "#d4701e", "#e3db63", "#a65018", "#e6bf36"),
  susanae = c("#fc9128", "#6eb2da", "#db551b", "#6335b4", "#5780d4", "#920e54"),
  fulgor = c("#97381a", "#b4917e", "#cfcdc5", "#df9d32", "#191919", "#6c7777"),
  fuscopunctata = c("#e4dfdf", "#1a1e23", "#c3d5e8", "#7f8288", "#637a9e", "#5b2e1f", "#b08044"),
  giesbrechtii = c("#7791bf", "#e69b28", "#89647d", "#d3e3f1", "#1f418d"),
  moseleyi = c("#d6c8bf", "#976c64", "#f9ba2e", "#d5dddc", "#48242f"),
  tristriatus = c("#1e1442", "#a2491b", "#5c2613", "#5773d4", "#8b5463", "#314482", "#4c3153"),
  caribensis = c("#8b5424", "#c7a661", "#a3a6aa", "#997f5a", "#522417", "#5b5f69"),
  orsaki = c("#e0d6c8", "#d7b592", "#472a23", "#be683d", "#84432b", "#7e6f64"),
  flowersi = c("#af9f53", "#0d130c", "#796a38", "#cfc7a7", "#734b2b", "#d6bd48"),
  trilineatum = c("#756654", "#442912", "#9d762a", "#85898a", "#c98a22")
)

#' A Polyclad flatworm palette generator
#'
#' These are a handful of color palettes from polyclad flatworm species.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#' have 5 or 6 colors. But hopefully we'll add more palettes soon.
#' @param name Name of desired palette. Choices are:
#'   \code{bimarginatus}, \code{jebborum},  \code{clavocapitata},
#'   \code{stimpsoni}, \code{bifurcus},  \code{nigropunctatus}, \code{murinus},
#'   \code{torquatum},  \code{ferrugineus} , \code{lindae} ,
#'   \code{aurantiacus}, \code{dimidiatus}, \code{susanae}, \code{fulgor},
#'   \code{fuscopunctata}, \code{giesbrechtii}, \code{moseleyi}, \code{tristriatus},
#'   \code{caribensis}, \code{orsaki}, \code{flowersi}, \code{trilineatum}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' polyclad_palette("jebborum")
#' polyclad_palette("bifurcus")
#' polyclad_palette("lindae")
#' polyclad_palette("fulgor", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- polyclad_palette(21, name = "moseleyi", type = "continuous")
#' image(orsaki, col = pal)
polyclad_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- polyclad_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    type = "continuous"
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
