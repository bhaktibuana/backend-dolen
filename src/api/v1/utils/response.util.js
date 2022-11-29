const resSuccess = (
  message,
  status,
  results,
  res,
  count = 0,
  next = null,
  previous = null
) => {
  res.status(status).json({
    success: true,
    status,
    message,
    count,
    next,
    previous,
    data: results,
    error: null,
  });
};

const resError = (message, status, error, res) => {
  res.status(status).json({
    success: false,
    status,
    message,
    count: null,
    next: null,
    previous: null,
    data: null,
    error: error ? error : null,
  });
};

module.exports = {
  resSuccess,
  resError,
};
