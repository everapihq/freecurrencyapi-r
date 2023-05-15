

success_check <- function(res) {

  if (!res$status_code) {
    stop(paste(
      "Error code:", res$error$code, "\n",
      "Error message:", res$error$info,
      "Error type:", res$error$type, "\n"
    ), call. = FALSE)
  }

  return(res)
}
