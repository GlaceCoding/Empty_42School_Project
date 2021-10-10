/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: GlaceCoding <github.com/GlaceCoding>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/10 19:26:10 by GlaceCoding       #+#    #+#             */
/*   Updated: 2021/10/10 22:45:02 by GlaceCoding      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minunit.h"
#include "../ex00/is_alphabet.c"

MU_TEST(test_check) {
	mu_check(is_alphabet("abc") == 1);
	mu_check(is_alphabet("AZ") == 1);
	mu_check(is_alphabet("azAZ") == 1);
	mu_check(is_alphabet("b_") == 0);
	mu_check(is_alphabet("_b") == 0);
	mu_check(is_alphabet("_ab") == 0);
	mu_check(is_alphabet("ab^") == 0);
	mu_check(is_alphabet("az-AZ") == 0);
	mu_check(is_alphabet("az_AZ") == 0);
	mu_check(is_alphabet("09") == 0);
}

MU_TEST_SUITE(test_suite) {
	MU_RUN_TEST(test_check);
}

int main(int argc, char *argv[]) {
	MU_RUN_SUITE(test_suite);
	MU_REPORT();
	return MU_EXIT_CODE;
}
