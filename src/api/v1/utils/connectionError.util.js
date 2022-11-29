const connectionError = (error, res) => {
  res.status(500).json({
    success: false,
    status: 500,
    message: "Unable to connect to database",
    count: null,
    next: null,
    previous: null,
    data: null,
    error: error ? error : null,
  });
};

module.exports = connectionError;
