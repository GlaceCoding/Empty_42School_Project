/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gphilipp <gphilipp@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/10 19:26:10 by GlaceCoding       #+#    #+#             */
/*   Updated: 2021/11/08 12:27:49 by gphilipp         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "minunit.h"
#include "../includes/rendu.h"

MU_TEST(allowed_function) {
	mu_check(system("sh ./test/allowed_function.sh") == 0);
}

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
	MU_RUN_TEST(allowed_function);
	MU_RUN_TEST(test_check);
}

int main(void) {
	MU_RUN_SUITE(test_suite);
	MU_REPORT();
	return MU_EXIT_CODE;
}
