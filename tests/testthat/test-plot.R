test_that(
  "The accel_plot() returns a ggplot object.",
  {
    data(ukb_accel)
    p <-  accel_plot(ukb_accel[1:100, ])
    expect_true(inherits(p, "gg"))
  }
)

test_that(
  "The accel_plot() errors when no time or freq column.",
  {
    data(iris)
    expect_error(accel_plot(iris))
  }
)

test_that(
  "The accel_plot() is correct for time-series data.",
  {
    data(ukb_accel)
    p <- accel_plot(ukb_accel[1:100, ])
    vdiffr::expect_doppelganger("first-100-samples", p)
  }
)

test_that(
  "The spectral_signature() errors when no X,Y,Z column.",
  {
    data(iris)
    expect_error(spectral_signature(iris))
  }
)

test_that(
  "The accel_plot of spectral_signature returns a ggplot object.",
  {
    data(ukb_accel)
    p <- spectral_signature(ukb_accel, take_log = FALSE)[1:100, ]|>accel_plot()
    expect_true(inherits(p, "gg"))
  }
)


test_that(
  "The accel_plot of spectral_signature returns a ggplot object.",
  {
    data(ukb_accel)
    p <- spectral_signature(ukb_accel, take_log = TRUE)[1:100, ]|>accel_plot()
    expect_true(inherits(p, "gg"))
  }
)
