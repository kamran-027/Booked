export interface User {
  Id?: Number;
  Name: string;
  Username: string;
  Password: string;
  PurchasedCourses?: Book[];
}

export interface Book {
  BookId: Number;
  Title: String;
  Author: String;
  UserId: Number;
}
