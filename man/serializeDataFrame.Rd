% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.R
\name{serializeDataFrame}
\alias{serializeDataFrame}
\title{Serializes the specified data.frame object to a vector of raw bytes.}
\usage{
serializeDataFrame(df, types = NULL, compress = FALSE, as.nullable = FALSE)
}
\arguments{
\item{df}{The data.frame object to serialize}

\item{types}{The type names for all column types. Must be a vector of
character values. May be NULL}

\item{compress}{A logical indicating whether to compress the content
of the returned raw vector}

\item{as.nullable}{A logical indicating whether the data.frame should
be serialized as a NullableDataFrame, even if it contains no NA values}
}
\value{
A raw vector representing the serialized date.frame object
}
\description{
The R data.frame is serialized as a Raven DataFrame. The concrete column
types to use for each individual data.frame column can be specified by
the 'types' argument.
}
\details{
The column types of the R data.frame object are mapped to the corresponding
Raven DataFrame column types. The following types exist:

\tabular{ll}{
\strong{Type name} \tab \strong{Description} \cr
byte \tab int8 \cr
short \tab int16 \cr
int \tab int32 \cr
long \tab int64 \cr
float \tab float32 \cr
double \tab float64 \cr
string \tab UTF-8 encoded unicode string \cr
char \tab single printable ASCII character \cr
boolean \tab logical value TRUE or FALSE \cr
binary \tab arbitrary length byte array \cr
}

By default, if the 'types' argument is not explicitly specified, all values
are mapped to the corresponding largest possible type in order to avoid
possible loss of information. However, users can specify the concrete type
for each column in the DataFrame file to be written. This is done by
providing a vector of character values denoting the type name of each
corresponding data.frame column. The index of each entry corresponds to the
index of the column in the underlying data.frame to persist.

If the specified data.frame object contains at least one NA value, then the
serialized DataFrame will represent a NullableDataFrame. If the data.frame
contains no NA values, then the serialized DataFrame will represent a
DefaultDataFrame, unless the 'as.nullable' argument is set to TRUE.

The logical 'compress' argument specifies whether the serialized DataFrame
is compressed.
}
\examples{
\dontrun{
# get a data.frame
df <- cars
# serialize the data.frame to a raw vector
vec <- serializeDataFrame(df)

# specify the concrete types of all columns
coltypes <- c("float", "double")
# serialize the data.frame to a raw vector with concrete types
serializeDataFrame(df, types = coltypes)
}

}
\seealso{
\code{\link[=writeDataFrame]{writeDataFrame()}} for directly persisting data.frame objects
to the file system
}
