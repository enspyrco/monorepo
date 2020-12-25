

export function unNull(variable : any, message: string) : NonNullable<any> {
  if (variable === null || typeof variable === "undefined") {
    throw Error(message);
  }

  return variable;
}