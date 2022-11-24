import 'dart:js';

import 'package:aq_admin/injection_container.dart';
import 'package:aq_admin/presentation/pages/add_city/add_city.page.dart';
import 'package:aq_admin/presentation/pages/add_district/add_district.page.dart';
import 'package:aq_admin/presentation/pages/admins/admins.page.dart';
import 'package:aq_admin/presentation/pages/another_estate/another_estate.page.dart';
import 'package:aq_admin/presentation/pages/booking/booking.page.dart';
import 'package:aq_admin/presentation/pages/city/city.page.dart';
import 'package:aq_admin/presentation/pages/create_admin/create_admin.page.dart';
import 'package:aq_admin/presentation/pages/create_estate/create_estate.page.dart';
import 'package:aq_admin/presentation/pages/create_role/create_role.page.dart';
import 'package:aq_admin/presentation/pages/dashboard/dashboard.page.dart';
import 'package:aq_admin/presentation/pages/estate_details/estate_details.page.dart';
import 'package:aq_admin/presentation/pages/estate_details/sub_pages/questions.sub.page.dart';
import 'package:aq_admin/presentation/pages/estate_details/sub_pages/review.sub.page.dart';
import 'package:aq_admin/presentation/pages/estates/estates.page.dart';
import 'package:aq_admin/presentation/pages/filter/filter.page.dart';
import 'package:aq_admin/presentation/pages/finance/finance.page.dart';
import 'package:aq_admin/presentation/pages/forget_password/forget_password.page.dart';
import 'package:aq_admin/presentation/pages/get_start/get_start.page.dart';
import 'package:aq_admin/presentation/pages/history/history.page.dart';
import 'package:aq_admin/presentation/pages/login/cubit/login_cubit.dart';
import 'package:aq_admin/presentation/pages/login/login.page.dart';
import 'package:aq_admin/presentation/pages/messages/messages.page.dart';
import 'package:aq_admin/presentation/pages/negotiation/negotiation.page.dart';
import 'package:aq_admin/presentation/pages/notifications/notifications.page.dart';
import 'package:aq_admin/presentation/pages/otp/otp.page.dart';
import 'package:aq_admin/presentation/pages/profile/profile.page.dart';
import 'package:aq_admin/presentation/pages/reset_password/reset_password.page.dart';
import 'package:aq_admin/presentation/pages/support/support.page.dart';
import 'package:aq_admin/presentation/pages/task/task.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  factory NavigationService.getInstance() => _instance;
  NavigationService._();
  static final _instance = NavigationService._();

  /// *    /
  static final getStarted = UniqueKey().toString();

  /// *    /login
  static final login = UniqueKey().toString();

  /// *    /login/forget_pass
  static final forgetPassword = UniqueKey().toString();

  /// *    /login/otp
  static final otp = UniqueKey().toString();

  /// *    /login/resetPass
  static final resetPass = UniqueKey().toString();

  /// *    /dashboard
  static final dashboard = UniqueKey().toString();

  /// *    /estates
  static final estates = UniqueKey().toString();

  /// *    /estates/{estateID}
  static final estate = UniqueKey().toString();

  /// *    /antherEstate
  static final anotherEstate = UniqueKey().toString();

  /// *    /history
  static final history = UniqueKey().toString();

  /// *    /filter
  static final filter = UniqueKey().toString();

  /// *    /estatesFilter?ownerName=mohamed
  static final estatesFilter = UniqueKey().toString();

  /// *    estate/createEstate
  static final createEstate = UniqueKey().toString();

  /// *    /booking
  static final booking = UniqueKey().toString();

  /// *    /negotiation
  static final negotiation = UniqueKey().toString();

  /// *    /question
  static final questions = UniqueKey().toString();

  /// *    /review
  static final review = UniqueKey().toString();

  /// *    /admins
  static final admins = UniqueKey().toString();

  /// *    /admins/createAdmin
  static final createAdmin = UniqueKey().toString();

  /// *    /admins/createRole
  static final createRole = UniqueKey().toString();

  /// *    /city
  static final city = UniqueKey().toString();

  /// *    /city/addCity
  static final addCity = UniqueKey().toString();

  /// *    /city/addDistrict
  static final addDistrict = UniqueKey().toString();

  /// *    /message
  static final message = UniqueKey().toString();

  /// *    /notifications
  static final notifications = UniqueKey().toString();

  /// *    /task
  static final task = UniqueKey().toString();

  /// *    /support
  static final support = UniqueKey().toString();

  /// *    /finance
  static final finance = UniqueKey().toString();

  /// *    /profile
  static final profile = UniqueKey().toString();
  late final router = GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: getStarted,
        path: '/',
        builder: (context, state) => const GetStartPage(),
      ),
      GoRoute(
        name: login,
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(sl()),
          child: const LoginPage(),
        ),
        routes: _loginSubRoutes,
      ),
      GoRoute(
        name: dashboard,
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: estates,
        path: '/estates',
        builder: (context, state) => EstatesPage(),
        routes: _estateSubRoutes,
      ),
      GoRoute(
        name: anotherEstate,
        path: '/anotherEstate',
        builder: (context, state) => const AnotherEstatePage(),
      ),
      GoRoute(
        name: history,
        path: '/history',
        builder: (context, state) => const HistoryPage(),
      ),
      GoRoute(
        name: filter,
        path: '/filter',
        builder: (context, state) => const FilterPage(),
      ),
      GoRoute(
        name: estatesFilter,
        path: '/estatesFilter',
        builder: (context, state) {
          return EstatesPage(
            ownerName: state.queryParams['ownerName'],
          );
        },
      ),
      GoRoute(
        name: booking,
        path: '/booking',
        builder: (context, state) => const BookingPage(),
      ),
      GoRoute(
        name: negotiation,
        path: '/negotiation',
        builder: (context, state) => const NegotiationPage(),
      ),
      GoRoute(
        name: questions,
        path: '/questions',
        builder: (context, state) => const QuestionsPage(),
      ),
      GoRoute(
        name: review,
        path: '/review',
        builder: (context, state) => const ReviewPage(),
      ),
      GoRoute(
        name: admins,
        path: '/admins',
        routes: _adminsSubRoutes,
        builder: (context, state) => const AdminsPage(),
      ),
      GoRoute(
        name: city,
        path: '/city',
        routes: _citySubRotes,
        builder: (context, state) => const CityPage(),
      ),
      GoRoute(
        name: message,
        path: '/message',
        builder: (context, state) => const MessagesPage(),
      ),
      GoRoute(
        name: notifications,
        path: '/notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        name: task,
        path: '/task',
        builder: (context, state) => const TaskPage(),
      ),
      GoRoute(
        name: support,
        path: '/support',
        builder: (context, state) => const SupportPage(),
      ),
      GoRoute(
        name: finance,
        path: '/finance',
        builder: (context, state) => const FinancePage(),
      ),
      GoRoute(
        name: profile,
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );

  List<RouteBase> get _citySubRotes {
    return [
      GoRoute(
        name: addCity,
        path: 'addCity',
        builder: (context, state) => const AddCityPage(),
      ),
      GoRoute(
        name: addDistrict,
        path: 'addDistrict',
        builder: (context, state) => const AddDistrictPage(),
      ),
    ];
  }

  List<RouteBase> get _adminsSubRoutes {
    return [
      GoRoute(
        name: createAdmin,
        path: 'createAdmin',
        builder: (context, state) => const CreateAdminPage(),
      ),
      GoRoute(
        name: createRole,
        path: 'createRole',
        builder: (context, state) => const CreateRolePage(),
      ),
    ];
  }

  List<RouteBase> get _estateSubRoutes {
    return [
      GoRoute(
        name: createEstate,
        path: 'createEstate',
        builder: (context, state) => const CreateEstatePage(),
      ),
      GoRoute(
        name: estate,
        path: ':estateId',
        builder: (context, state) => EstateDetailsPage(
          estateId: state.params['estateId']!,
        ),
      )
    ];
  }

  List<RouteBase> get _loginSubRoutes {
    return [
      GoRoute(
        name: forgetPassword,
        path: 'forget_pass',
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      GoRoute(
        name: otp,
        path: 'otp',
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        name: resetPass,
        path: 'resetPass',
        builder: (context, state) => const ResetPasswordPage(),
      ),
    ];
  }
}
