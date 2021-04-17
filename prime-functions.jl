using Random, LinearAlgebra, PyCall
np = pyimport("numpy")

function is_prime(val)
    if val == 1
        return false
    elseif val == 2
        return true
    elseif val % 2 == 0
        return false
    elseif val > 3 && val % 3 == 0 || val > 5 && val % 5 == 0 || val > 7 && val % 7 == 0 || val > 11 && val % 11 == 0 || val > 13 && val % 13 == 0 || val > 17 && val % 17 == 0 || val > 19 && val % 19 == 0
        return false
    else
        res = true
        for i = 3:2:round(sqrt(val))
            if val % i == 0
                res = false
                break
            end
        end
        return res
    end
end

function nth_prime(val)
    counter = 1
    if val == 1
        return 2
    else
        res = false
        loop = true
        i = 3
        while loop
            if is_prime(i)
                counter += 1
                if counter == val
                    res = i
                    loop = false
                    break
                end
            end
            i += 2
        end
        return res
    end
end

function index_of_prime(val)
    if !is_prime(val)
        return false
    else
        i = 1
        res = 0
        while true
            if nth_prime(i) == val
                res = i
                break
            end
            i+=1
        end
        return res
    end
end

function nth_primes_sum(args...)
    sum = 0
    for i in args
        sum += nth_prime(i)
    end
    return sum
end

function nth_primes_times(args...)
    times = 1
    for i in args
        times *= nth_prime(i)
    end
    return times
end

function next_prime(val)
    if !is_prime(val)
        return false
    else
        counter = 1
        stop_counter = 0
        while true
            current_prime = nth_prime(counter)
            if current_prime == val
                stop_counter = counter
                break
            else
                counter += 1
            end
        end
        return nth_prime(stop_counter + 1)
    end
end

function prev_prime(val)
    if !is_prime(val) || val == 2
        return false
    else
        counter = 1
        stop_counter = 0
        while true
            current_prime = nth_prime(counter)
            if current_prime == val
                stop_counter = counter
                break
            else
                counter += 1
            end
        end
        return nth_prime(stop_counter - 1)
    end
end

function prime_smaller_than(val)
    if is_prime(val)
        return prev_prime(val)
    else
        i = 1
        res = 0
        while true
            if val < nth_prime(i+1) && val > nth_prime(i)
                res = nth_prime(i)
                break
            end
            i += 1
        end
        return res
    end
end

function prime_bigger_than(val)
    if is_prime(val)
        return next_prime(val)
    else
        i = 1
        res = 0
        while true
            if val > nth_prime(i) && val < nth_prime(i + 1)
                res = nth_prime(i+1)
                break
            end
            i += 1
        end
        return res
    end
end

function prime_divisors(val)
    if is_prime(val)
        return false
    else
        # Array{Int64}(undef, 0)
        arr = Array{Int64, 1}(undef, 0)
        if val % 2 == 0
            push!(arr, 2)
        end
        for i = 3:2:val
            if is_prime(i) && val % i == 0
                push!(arr, i)
            end
        end
        return arr
    end
end

function prime_factors(val)
    if is_prime(val)
        return false
    else
        arr = Array{Int64, 1}(undef, 0)
        if val % 2 == 0
            push!(arr, 2)
        end
        for i = 3:2:val
            if is_prime(i) && val % i == 0
                push!(arr, i)
            end
        end
        return arr
    end
end

function prime_divisors_sum(val)
    if is_prime(val)
        return false
    else
        divisors = prime_divisors(val)
        res = 0
        for i in divisors
            res += i
        end
        return res
    end
end

function prime_divisors_times(val)
    if is_prime(val)
        return false
    else
        divisors = prime_divisors(val)
        res = 1
        for i in divisors
            res *= i
        end
        return res
    end
end

function is_mersenne_prime(val)
    if !is_prime(val)
        return false
    else
        val = val + 1
        prime_divisors_res = prime_divisors(val)
        if length(prime_divisors_res) == 1 && prime_divisors_res[1] == 2
            return true
        else
            return false
        end
    end
end

function nth_mersenne_prime(nth)
    counter = 0
    res = false
    loop = true
    i = 1
    while loop
        curr = (2 ^ i) - 1
        if is_prime(curr)
            counter += 1
            if counter == nth
                res = curr
                loop = false
                break
            end
        end
        i += 1
    end
    return res
end

function nth_mersenne_prime_exponents(nth)
    mersenne = nth_mersenne_prime(nth)
    mersenne = mersenne + 1
    i = 0
    stop = false
    ret = false
    while !stop
        i += 1
        if mersenne / 2 == 1
            ret = i
            stop = true
            break
        else
            mersenne = mersenne / 2
        end
    end
    return ret
end

function is_prime_or_divisors(val)
    if is_prime(val)
        return true
    else
        return prime_divisors(val)
    end
end

function primes_smaller_than(val)
    i = 1
    res = Array{Int64, 1}(undef, 0)
    loop = true
    while loop
        push!(res, nth_prime(i))
        if val <= nth_prime(i + 1) && val >= nth_prime(i)
            loop = false
            break
        end
        i += 1
    end
    return res
end

function closest_prime(val)
    bigger = false
    smaller = false

    for i = val+1:val^3
        if is_prime(i)
            bigger = i
            break
        end
    end
    
    for j = val-1:-1:1
        if is_prime(j)
            smaller = j
            break
        end
    end

    res = 0
    
    if bigger == false
        res = smaller
    elseif smaller == false || bigger - val == val - smaller || bigger - val < val - smaller
        res = bigger
    else
        res = smaller
    end
    return res
end

function random_prime(min=1, max=999999999999999)
    rnd = rand(min:max)
    if rnd < 0
        rnd *= -1
    end
    return closest_prime(rnd)
end

function next_n_primes(val, n)
    primes = Array{Int64, 1}(undef, 0)
    it = false
    for i = 1:n
        if i == 1
            it = prime_bigger_than(val)
        else
            it = next_prime(it)
        end
        push!(primes, it)
    end
    return primes
end

function prev_n_primes(val, n)
    primes = Array{Int64, 1}(undef, 0)
    it = false
    for i = n:-1:1
        if i == n
            it = prime_smaller_than(val)
        else
            it = prev_prime(it)
        end
        push!(primes, it)
    end
    return primes
end

function primes_between(p1, p2)
    check = true
    start = false
    finish = false
    if p1 > p2
        start = p2
        finish = p1
    elseif p2 > p1
        start = p1
        finish = p2
    else
        check = false
    end

    if check
        res = Array{Int64, 1}(undef, 0)
        first = prime_bigger_than(start)

        push!(res, first)

        contin = true
        
        while contin
            first = next_prime(first)
            if first >= finish
                contin = false
                break
            else
                push!(res, first)
            end
        end
        return res
    else
        return false
    end
end

function first_n_primes(n)
    if n <= 0
        return false
    else
        primes = Array{Int64, 1}(undef, 0)
        next = 2
        for i = 1:n+1
            push!(primes, next)
            next = next_prime(next)
        end
        return primes
    end
end





function fermat_test(n::Int64, k::Int64)
    function power(a, n, p)
        function fraction(val, divisor)
            return (val - (val % divisor)) / divisor
        end
    
        res = 1
        a = a % p
    
        while n > 0
            if n % 2 == 1
                res = (res * a) % p
            end
    
            n = fraction(n, 2)
            a = (a * a) % p
        end
        return res
    end

    if n <= 1 || n == 4 || n % 2 == 0
        return false
    end
    if n <= 3
        return true
    end

    while k > 0
        a = 2 + rand(1:999999) % (n - 4)

        if power(a, n-1, n) != 1
            return false
        end
        k -= 1
    end

    return true
end

function miiller_test(n, k)
    function power(a, n, p)
        function fraction(val, divisor)
            return (val - (val % divisor)) / divisor
        end
    
        res = 1
        a = a % p
    
        while n > 0
            if n % 2 == 1
                res = (res * a) % p
            end
    
            n = fraction(n, 2)
            a = (a * a) % p
        end
        return res
    end
    function test(d, n)
        a = 2 + rand(1:999999) % (n - 4)

        x = power(a, d, n)

        if x == 1 || x == n-1
            return true
        end

        while d != n-1
            x = (x * x) % n
            d *= 2

            if x == 1
                return false
            end
            if x == n-1
                return true
            end
        end
        return false
    end

    # n, k
    if n <= 1 || n == 4
        return false
    end
    if n <= 3
        return true
    end

    d = n - 1
    while d % 2 == 0
        d /= 2
    end

    for i = 0:k
        if !test(d, n)
            return false
        end
    end
    return true
end

function lucas_lehmer_test(p)
    M = (2 ^ p) - 1
    s = 4
    for i = 1:p-2
        s = ((s^2) - 2) % M
    end
    return s == 0
end
