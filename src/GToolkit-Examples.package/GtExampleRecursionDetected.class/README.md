I represent an error that occurs when we have cycles in static example dependencies. The cycles can be either direct or indirect. For example,  these configurations induces an error:
- a depends-on b, b depends-on a
- a depends-on b, b depends-on c, c depends-on a