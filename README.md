# Prime Functions in Julia

Primes are of the utmost importance to number theorists because they are the building blocks of whole numbers, and important to the world because their odd mathematical properties make them perfect for our current uses.
On that matter I've built this library to create, find and operate the prime numbers with Julia

### Features

- Basic prime number generators
- Primes' indexes
- High performance
- Some special prime arrays
- Relations with normal integers

## Functions
- [is_prime](#is_primenumber)
- [nth_prime](#nth_primeorder)
- [index_of_prime](#index_of_primeprime_number)
- [nth_primes_sum](#nth_primes_sumarguments)
- [nth_primes_times](#nth_primes_timesarguments)
- [next_prime](#next_primecurrentprime)
- [prev_prime](#prev_primecurrentprime)
- [prime_smaller_than](#prime_smaller_thannumber)
- [prime_bigger_than](#prime_bigger_thannumber)
- [prime_divisors](#prime_divisorsnonprimenumber)
- [prime_divisors_sum](#prime_divisors_sumnonprimenumber)
- [prime_divisors_times](#prime_divisors_timesnonprimenumber)
- [is_mersenne_prime](#is_mersenne_primenumber)
- [nth_mersenne_prime](#nth_mersenne_primeeorder)
- [nth_mersenne_prime_exponents](#nth_mersenne_prime_exponentsorder)
- [is_prime_or_divisors](#is_prime_or_divisorsnumber)
- [primes_smaller_than](#primes_smaller_thannumber)
- [closest_prime](#closest_primenumber)
- [random_prime](#random_primeminval-maxval)
- [next_n_primes](#next_n_primesminval-n)
- [prev_n_primes](#prev_n_primesnumber-n)
- [primes_between](#primes_betweennumber1-number2)
- [first_n_primes](#first_n_primescount)


#### is_prime(number)
Return if a number is [Prime Number](https://en.wikipedia.org/wiki/Prime_number)
```julia
result = is_prime(13);    # true
```

#### nth_prime(order)
Get nth prime
```julia
result = nth_prime(5);    # 11
```
#### index_of_prime(prime_number)
Get index of prime number
```julia
result = index_of_prime(13);    # 5
```
Index starts from 0
#### nth_primes_sum(...arguments)
```julia
result = nth_primes_sum(3,5,7);    # 5 + 11 + 17 = 33
```
#### nth_primes_times(...arguments)
```julia
result = nth_primes_times(3,5,7);    # 5 * 11 * 17 = 935
```
#### next_prime(currentPrime)
```julia
result = next_prime(17);    # 19
```
#### prev_prime(currentPrime)
```julia
result = prev_prime(17);    # 13
```
#### prime_smaller_than(number)
```julia
result = prime_smaller_than(100);    # 97
```
#### prime_bigger_than(number)
```julia
result = prime_bigger_than(100);    # 101
```
#### prime_divisors(nonPrimeNumber)
```julia
result = prime_divisors(42);    # [2,3,7]
```
#### prime_divisors_sum(nonPrimeNumber)
```julia
result = prime_divisors_sum(42);    # 2 + 3 + 7 = 12
```
#### prime_divisors_times(nonPrimeNumber)
```julia
result = prime_divisors_times(42);    # 2 * 3 * 7 = 42
```
#### is_mersenne_prime(primeNumber)
Checks if a prime is a [Mersenne Prime](https://en.wikipedia.org/wiki/Mersenne_prime)
```julia
result = is_mersenne_prime(127);    # true
```
#### nth_mersenne_prime(order)
Get nth [Mersenne Prime](https://en.wikipedia.org/wiki/Mersenne_prime)
```julia
result = nth_mersenne_prime(5);    # 8191
```
#### nth_mersenne_prime_exponents(order)
Get nth [Mersenne Prime](https://en.wikipedia.org/wiki/Mersenne_prime)'s exponents
```julia
result = nth_mersenne_prime_exponents(5);    # 13  - That means 2^13
```
#### is_prime_or_divisors(number)
If the number is prime it returns true, otherwise it returns prime divisors
#### primes_smaller_than(number)
```julia
result = primes_smaller_than(25);    # [ 2, 3, 5, 7, 11, 13, 17, 19, 23 ]
```
#### closest_prime(number)
```julia
result = closest_prime(25);    # 23
```
#### random_prime(minVal, maxVal)
```julia
result = random_prime(25, 48);    # 31
```
#### next_n_primes(minVal, n)
```julia
result = next_n_primes(25, 5);    # [ 29, 31, 37, 41, 43 ]
```
#### prev_n_primes(number, n)
```julia
result = prev_n_primes(25, 5);    # [ 23, 19, 17, 13, 11 ]
```
#### primes_between(number1, number2)
```julia
result = primes_between(80, 150);    # [ 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149 ]
```
#### first_n_primes(count)
```julia
result = first_n_primes(7);    # [ 2, 3, 5, 7, 11, 13, 17 ]
```