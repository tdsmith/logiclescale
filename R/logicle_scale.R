#' Logicle transformation for ggplot2.
#' See ?flowCore::logicletGml2 for the definition of the parameters.
#' @export
logicle_trans = function(w=0.5, t=262144, m=4.5) {
  logicleTransform = flowCore::logicleTransform(w=w, t=t, m=m, a=0)
  transform = function(x) {
    logicleTransform(x)
  }
  inverse = function(x) {
    flowCore::inverseLogicleTransform("inverseLogicle", logicleTransform)(x)
  }
  breaks = function(x) {
    lim = 10**(1+w)
    linear = scales::pretty_breaks(n=3, min.n=3)(c(x[1], lim))
    logs = scales::log_breaks(10)(c(lim, x[2]))
    unique(c(linear[linear <= lim], logs[logs > lim]))
  }
  scales::trans_new("logicle", transform, inverse, breaks)
}
