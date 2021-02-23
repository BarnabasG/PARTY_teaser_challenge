# PARTY_teaser_challenge
A Prolog solution to the Sunday Times published its weekly Teaser 3026, September 20th 2020

The rules of the challenge are as follows:
    A four-digit number with different positive digits and with the numbers represented by its last two digits a multiple of the number represented by its first
        two digits, is called a PAR.
    A pair of PARs is a PARTY if no digit is repeated and each PAR is a multiple
        of the missing positive digit.
    I wrote down a PAR and challenged Sam to use it to make a PARTY. He was
        successful.
    I then challenged Beth to use my PAR and the digits in Sam’s PAR to make
        a different PARTY. She too was successful.
    What was my PAR?
  
An example PAR is 7826, and an example PARTY is ( 9632, 5418 ).
Note that in this Teaser, zero is not considered to be a positive digit.
  
My goal was to create a solution in the logical programming language Prolog to find every logically correct PARTY.
