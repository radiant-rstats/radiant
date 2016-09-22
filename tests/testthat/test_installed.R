context("Installed")

test_that("radiant.data", {
  expect_true("radiant.data" %in% installed.packages())
})

test_that("radiant.design", {
  expect_true("radiant.design" %in% installed.packages())
})

test_that("radiant.basics", {
  expect_true("radiant.basics" %in% installed.packages())
})

test_that("radiant.model", {
  expect_true("radiant.model" %in% installed.packages())
})

test_that("radiant.multivariate", {
  expect_true("radiant.multivariate" %in% installed.packages())
})
